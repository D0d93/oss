NAME         top
       sed - stream editor for filtering and transforming text
SYNOPSIS         top
       sed [OPTION]... {script-only-if-no-other-script} [input-file]...
DESCRIPTION         top
       Sed is a stream editor.  A stream editor is used to perform basic
       text transformations on an input stream (a file or input from a
       pipeline).  While in some ways similar to an editor which permits
       scripted edits (such as ed), sed works by making only one pass
       over the input(s), and is consequently more efficient.  But it is
       sed's ability to filter text in a pipeline which particularly
       distinguishes it from other types of editors.

       -n, --quiet, --silent

              suppress automatic printing of pattern space

       --debug

              annotate program execution

       -e script, --expression=script

              add the script to the commands to be executed

       -f script-file, --file=script-file

              add the contents of script-file to the commands to be
              executed

       --follow-symlinks

              follow symlinks when processing in place

       -i[SUFFIX], --in-place[=SUFFIX]

              edit files in place (makes backup if SUFFIX supplied)

       -l N, --line-length=N

              specify the desired line-wrap length for the `l' command

       --posix

              disable all GNU extensions.

       -E, -r, --regexp-extended

              use extended regular expressions in the script (for
              portability use POSIX -E).

       -s, --separate

              consider files as separate rather than as a single,
              continuous long stream.

       --sandbox

              operate in sandbox mode (disable e/r/w commands).

       -u, --unbuffered

              load minimal amounts of data from the input files and
              flush the output buffers more often

       -z, --null-data

              separate lines by NUL characters

       --help
              display this help and exit

       --version
              output version information and exit

       If no -e, --expression, -f, or --file option is given, then the
       first non-option argument is taken as the sed script to
       interpret.  All remaining arguments are names of input files; if
       no input files are specified, then the standard input is read.

       GNU sed home page: <https://www.gnu.org/software/sed/>.  General
       help using GNU software: <https://www.gnu.org/gethelp/>.  E-mail
       bug reports to: <bug-sed@gnu.org>.
COMMAND SYNOPSIS         top
       This is just a brief synopsis of sed commands to serve as a
       reminder to those who already know sed; other documentation (such
       as the texinfo document) must be consulted for fuller
       descriptions.

   Zero-address ``commands''
       : label
              Label for b and t commands.

       #comment
              The comment extends until the next newline (or the end of
              a -e script fragment).

       }      The closing bracket of a { } block.

   Zero- or One- address commands
       =      Print the current line number.

       a \

       text   Append text, which has each embedded newline preceded by a
              backslash.

       i \

       text   Insert text, which has each embedded newline preceded by a
              backslash.

       q [exit-code]
              Immediately quit the sed script without processing any
              more input, except that if auto-print is not disabled the
              current pattern space will be printed.  The exit code
              argument is a GNU extension.

       Q [exit-code]
              Immediately quit the sed script without processing any
              more input.  This is a GNU extension.

       r filename
              Append text read from filename.

       R filename
              Append a line read from filename.  Each invocation of the
              command reads a line from the file.  This is a GNU
              extension.

   Commands which accept address ranges
       {      Begin a block of commands (end with a }).

       b label
              Branch to label; if label is omitted, branch to end of
              script.

       c \

       text   Replace the selected lines with text, which has each
              embedded newline preceded by a backslash.

       d      Delete pattern space.  Start next cycle.

       D      If pattern space contains no newline, start a normal new
              cycle as if the d command was issued.  Otherwise, delete
              text in the pattern space up to the first newline, and
              restart cycle with the resultant pattern space, without
              reading a new line of input.

       h H    Copy/append pattern space to hold space.

       g G    Copy/append hold space to pattern space.

       l      List out the current line in a ``visually unambiguous''
              form.

       l width
              List out the current line in a ``visually unambiguous''
              form, breaking it at width characters.  This is a GNU
              extension.

       n N    Read/append the next line of input into the pattern space.

       p      Print the current pattern space.

       P      Print up to the first embedded newline of the current
              pattern space.

       s/regexp/replacement/
              Attempt to match regexp against the pattern space.  If
              successful, replace that portion matched with replacement.
              The replacement may contain the special character & to
              refer to that portion of the pattern space which matched,
              and the special escapes \1 through \9 to refer to the
              corresponding matching sub-expressions in the regexp.

       t label
              If a s/// has done a successful substitution since the
              last input line was read and since the last t or T
              command, then branch to label; if label is omitted, branch
              to end of script.

       T label
              If no s/// has done a successful substitution since the
              last input line was read and since the last t or T
              command, then branch to label; if label is omitted, branch
              to end of script.  This is a GNU extension.

       w filename
              Write the current pattern space to filename.

       W filename
              Write the first line of the current pattern space to
              filename.  This is a GNU extension.

       x      Exchange the contents of the hold and pattern spaces.

       y/source/dest/
              Transliterate the characters in the pattern space which
              appear in source to the corresponding character in dest.
