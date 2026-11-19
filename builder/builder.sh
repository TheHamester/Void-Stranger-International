#!/bin/sh

# if [ -f ./variables.sh ]; then
#     ./variables.sh
# fi

update=0

while true; do
    if [ -f "$UNDERTALEMODCLI_PATH" ]; then
        break
    fi
    update=1
    read -p "Insert path to UndertaleModCli.exe:" UNDERTALEMODCLI_PATH
done

while true; do
    if [ -d "$VOID_STRANGER_PATH" ]; then
        break
    fi
    update=1
    read -p "Insert path to Void Stranger's directory:" VOID_STRANGER_PATH
done

# if [ $update -eq 1 ]; then
#     echo "UNDERTALEMODCLI_PATH=\"$UNDERTALEMODCLI_PATH\"">variables.sh
#     echo "VOID_STRANGER_PATH=\"$VOID_STRANGER_PATH\"">>variables.sh
#     chmod +x variables.sh
#     update=0
# fi

if [ ! -f "$VOID_STRANGER_PATH/data.win.bak" ]; then
    cp "$VOID_STRANGER_PATH/data.win" "$VOID_STRANGER_PATH/data.win.bak"
fi


"$UNDERTALEMODCLI_PATH" load "$VOID_STRANGER_PATH/data.win.bak" --scripts "./csx/merger.csx" --output "$VOID_STRANGER_PATH/data.win"
#/home/hamester/Code/Not\ Mine/UTMT_CLI_v0.8.2.0-Ubuntu/UndertaleModCli
#/home/hamester/.local/share/Steam/steamapps/common/Void\ Stranger
