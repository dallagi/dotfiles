function ask_to_continue() {
    echo
    echo $1
    read -p "Continue? ([y]es or [N]o): "
    case $(echo $REPLY | tr '[A-Z]' '[a-z]') in
        y|yes)
            echo "- "$2"..."
            ;;
        *)
            echo "Quitting"
            exit 0
            ;;
    esac
}