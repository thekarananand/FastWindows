class LogHandler:
    def SectionHeading(self, section_name):
        print("")
        print("==================================================")
        print(section_name)
        print("==================================================")
        print("")

    def red(self, tag, desc):
        print(f"\033[31m[{tag}] {desc}\033[0m")

    def amber(self, tag, desc):
        print(f"\033[33m[{tag}] {desc}\033[0m")

    def green(self, tag, desc):
        print(f"\033[32m[{tag}] {desc}\033[0m")

    def info(self, logline):
        print(logline)
