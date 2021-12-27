"""
Contains all global variables and genetic helper functions
"""
extends Node


enum error_level {WARN, ERROR, INFO}
var errors = 0
func Error(message:String, default:String="", level:int=error_level.WARN) -> void:
    if level == error_level.INFO:
        print("\nINFORMATION\n===========")
    elif level == error_level.WARN:
        print("\nWARNING\n=======")        
    elif level == error_level.ERROR:
        print("\n=====\nError\n=====")
    
    print(message)
    if default:
        print("Defaulting to behaviour: ", default)
    print()

    errors += 1

func _notification(what):
    if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
        print("\nQuitting game")
        if errors > 0:
            print("Error(s) Encountered: ", errors)
        else:
            print("What no errors?? I think the error count has a bug")

        get_tree().quit() # default behavior
