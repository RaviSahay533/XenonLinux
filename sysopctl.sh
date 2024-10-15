#!/bin/bash

# sysopctl v0.1.0 - A system resource management tool
VERSION="v0.1.0"

# Help function
show_help() {
    echo "Usage: sysopctl [command] [options]"
    echo "Commands:"
    echo "  service list            - List running services"
    echo "  service start <name>    - Start a service"
    echo "  service stop <name>     - Stop a service"
    echo "  system load             - View system load"
    echo "  disk usage              - Check disk usage"
    echo "  process monitor         - Monitor system processes"
    echo "  logs analyze            - Analyze system logs"
    echo "  backup <path>           - Backup system files"
    echo "  --help                  - Show this help message"
    echo "  --version               - Show version information"
}

# Version function
show_version() {
    echo "sysopctl version $VERSION"
}
list_services() {
    systemctl list-units --type=service
}
view_system_load() {
    uptime
}
start_service() {
    systemctl start "$1"
}

stop_service() {
    systemctl stop "$1"
}
check_disk_usage() {
    df -h
}
monitor_processes() {
    top
}
analyze_logs() {
    journalctl -p crit
}
backup_files() {
    rsync -avh "$1" /backup/
}
# Parse commands
case "$1" in
    --help)
        show_help
        ;;
    --version)
        show_version
        ;;
    service)
        if [ "$1" == "service" ] && [ "$2" == "list" ]; then
          list_services
        fi
        if [ "$1" == "service" ] && [ "$2" == "start" ]; then
          start_service "$3"
        fi

        if [ "$1" == "service" ] && [ "$2" == "stop" ]; then
          stop_service "$3"
        fi
        ;;
    system)
        if [ "$1" == "system" ] && [ "$2" == "load" ]; then
          view_system_load
        fi
        ;;
    disk)
        if [ "$1" == "disk" ] && [ "$2" == "usage" ]; then
         check_disk_usage
        fi
        ;;
    process)
        if [ "$1" == "process" ] && [ "$2" == "monitor" ]; then
           monitor_processes
        fi
        ;;
    logs)
        if [ "$1" == "logs" ] && [ "$2" == "analyze" ]; then
          analyze_logs
        fi
        ;;
    backup)
        if [ "$1" == "backup" ]; then
          backup_files "$2"
        fi
        ;;
    *)
        echo "Invalid command. Use --help for available options."
        ;;
esac
