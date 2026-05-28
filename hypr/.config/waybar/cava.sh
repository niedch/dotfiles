#!/usr/bin/env bash
set -u

CONFIG_FILE="/tmp/waybar_cava_config"
LOCK_DIR="/tmp/waybar_cava.lock"
FIFO_0="/tmp/waybar_cava_fifo_0"
FIFO_1="/tmp/waybar_cava_fifo_1"

bars=(⠀ ⠁ ⠃ ⠇ ⠏ ⠟ ⠿ ⣿)

if mkdir "$LOCK_DIR" 2>/dev/null; then
    IS_PRIMARY=1
    echo "$$" > "$LOCK_DIR/pid"

    cat > "$CONFIG_FILE" <<'CAVA_EOF'
[general]
bars = 6
framerate = 20
autosens = 1
reverse = 1
rate = 22050
noise_reduction = 0.77

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
channels = mono
mono_option = average
CAVA_EOF

    rm -f "$FIFO_0" "$FIFO_1"
    mkfifo "$FIFO_0" "$FIFO_1"

    cleanup() {
        pkill -P $$ 2>/dev/null
        kill "$CAVA_PID" 2>/dev/null
        rm -f "$FIFO_0" "$FIFO_1" "$CONFIG_FILE"
        rm -rf "$LOCK_DIR"
        exit 0
    }
    trap cleanup EXIT SIGTERM SIGINT

    cava -p "$CONFIG_FILE" 2>/dev/null \
        | tee >(cat > "$FIFO_0") >(cat > "$FIFO_1") > /dev/null &
    CAVA_PID=$!

    MY_FIFO="$FIFO_0"
else
    IS_PRIMARY=0

    cleanup() { exit 0; }
    trap cleanup EXIT SIGTERM SIGINT

    MY_FIFO="$FIFO_1"
fi

convert_to_bars() {
    local line="$1"
    local IFS=';'
    local -a nums
    read -ra nums <<< "$line"
    local out=""
    local n
    for n in "${nums[@]}"; do
        if (( n < 0 || n > 7 )); then
            n=0
        fi
        out+="${bars[n]}"
    done
    printf '%s\n' "$out"
}

is_silence() {
    local l="${1//;/}"
    [[ -z "${l//0/}" ]]
}

while [ ! -p "$MY_FIFO" ]; do
    if [ "$IS_PRIMARY" = 0 ]; then
        ppid=$(cat "$LOCK_DIR/pid" 2>/dev/null) || { sleep 0.1; continue; }
        kill -0 "$ppid" 2>/dev/null || exit 1
    fi
    sleep 0.1
done

pause_start=0

while IFS= read -r line || [[ -n "$line" ]]; do
    if is_silence "$line"; then
        if (( pause_start == 0 )); then
            pause_start=$SECONDS
        fi
        if (( SECONDS - pause_start >= 2 )); then
            echo ""
        else
            convert_to_bars "$line"
        fi
        continue
    fi
    pause_start=0
    convert_to_bars "$line"
done < "$MY_FIFO"
