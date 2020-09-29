# Edit files with `sudo -e`, preserving file ownership
edit() {
    local file="$1"
    if [[ -z "$file" || ! -e "$file" ]]; then
        echo "error: no filename given or invalid file" >&2
        return 42
    fi

    # try Linux version first, then Mac:
    local oid="$(stat -c '%u' "$file" || stat -f '%u' "$file")" 2>/dev/null
    if [[ $? != 0 || -z "$oid" ]]; then
        echo "error: could not determine file ownership" >&2
        return 43
    fi

    sudo -e -u "#$oid" "$file"
}

# Generates random alphanumeric passwords
#
# Optional parameters:
#  1) length (default: 14)
#  2) extra characters to choose from (whitespace will be stripped)
#
# Example: random_chars 14 '- + /'
random_chars() {
    local extra="${2//[[:space:]]/}"
    LC_ALL=C tr -cd "[:alnum:]$extra" </dev/urandom | head -c "${1:-14}"; echo
}

# Use the Maven wrapper if available, even when typing "mvn"
if command -v mvn >/dev/null; then
    function mvn() {
        if [[ -x ./mvnw ]]; then
            ./mvnw $@
        else
            command mvn $@
        fi
    }
fi

# Use the Gradle wrapper if available, even when typing "gradle"
if command -v gradle >/dev/null; then
    function gradle() {
        if [[ -x ./gradlew ]]; then
            ./gradlew $@
        else
            command gradle $@
        fi
    }
fi

# Safe in-place file recode from latin1 to utf-8
latin2unicode() {
    local file=$1
    if [[ "$file" == "" ]]; then
        echo "error: no file name given" >&2
        return 1
    fi
    local tmp="$(mktemp)"
    iconv -f latin1 -t utf8 "$file" >"$tmp" && mv "$tmp" "$file"
    rm -f "$tmp"
}
