import os
import sys
import subprocess

def setup():
    bashrc_path = os.path.expanduser('~/.bashrc')
    alias_cmd = "alias cd='python " + os.path.abspath(__file__) + " '\n"
    with open(bashrc_path, 'a') as f:
        f.write(alias_cmd)
    print("Setup complete! Please restart your terminal or run 'source ~/.bashrc'")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        path = sys.argv[1]
    else:
        path = '~'

    if os.path.exists(os.path.expanduser('~/.bashrc')):
        with open(os.path.expanduser('~/.bashrc'), 'r') as f:
            if f"alias cd='python {os.path.abspath(__file__)} '" not in f.read():
                setup()
    else:
        setup()

    os.chdir(os.path.expanduser(path))
    subprocess.run(['ls'])
    os.execvp('bash', ['bash'])
