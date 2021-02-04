# source /usr/share/peda/peda.py
source /usr/share/pwndbg/gdbinit.py
source /home/red/code/splitmind/gdbinit.py
python
import splitmind
(splitmind.Mind()
  .above(of="main", display="disasm", size="40%")
  .right(of="disasm", display="regs")
  .below(of="main", display="stack")
  .right(of="stack", display="backtrace")
  .select(None)
  .right(cmd="ipython")
  .show("legend", on="disasm")
).build()
end
