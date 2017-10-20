import subprocess
import getopt
import sys

STACK_FILE = "/tmp/.scratchpad"

def usage():
	"""
	" Display usage and help
	"""

	print "scratchpad utility for bspwm"
	print
	print "       -h, --help      Show help"
	print "       -p, --push      Push current node to scratchpad"
	print "       -t, -toggle     Toggle scratchpad nodes"
	print

def command(command):
	"""
	" Execute command and return output
	"""

	return subprocess.check_output(command, shell = True).decode("utf-8").strip()

def push(node = False):
	"""
	" Push current node to the scratchpad stack
	"""

	command("bspc node -t floating")

def toggle():
	"""
	" Toggle scratchpad nodes
	"""

	try:
		nodes   = command("bspc query -N -n '.floating'").strip().split('\n')
		hidden  = list()
		actives = list()

		try:
			hidden  = command("bspc query -N -n '.floating.hidden'").strip().split('\n')
			actives = list(set(nodes) - set(hidden))

			for active in actives:
				command("bspc node %s -g hidden" % active)
		except subprocess.CalledProcessError:
			pass

		if actives:
			return

		with open(STACK_FILE, "r+") as stack:
			content = [x.strip() for x in stack.readlines()]
			content = filter(None, content)

			# Truncate the file content in order to prevent many, many nodes
			stack.seek(0)
			stack.truncate()

			if not content:
				content = nodes

			for line in content[1:]:
				stack.write("%s\n" % line)

			stack.write("%s\n" % content[0])

			if not actives:
				command("bspc node %s -g hidden" % content[0])

	except subprocess.CalledProcessError:
		pass

def main(argv):
	"""
	" Main method
	"""

	try:
		opts, args = getopt.getopt(argv, "hpt", ["help", "push", "toggle"])
	except getopt.GetoptError:
		usage()
		sys.exit(2)

	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()

		elif opt in ("-p", "--push"):
			push()

		elif opt in ("-t", "--toggle"):
			toggle()

if __name__ == "__main__":
    main(sys.argv[1:])
