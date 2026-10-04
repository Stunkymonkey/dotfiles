# Git commit attribution

Follow the Linux kernel convention for AI attribution
(https://docs.kernel.org/process/coding-assistants.html):

- End every git commit message with an `Assisted-by` trailer in the form
  `Assisted-by: LLM [TOOL1] [TOOL2]`.
- `LLM` is the exact model ID of the model currently running (e.g.
  `claude-opus-5-5`), written as one token without spaces.
- Only list specialized analysis tools that were actually used (e.g. coccinelle,
  sparse, smatch, clang-tidy). Do not list basic tools such as git, gcc, make or
  editors. Usually there are none, so the trailer is just `Assisted-by: <model-id>`.
- Never add `Co-Authored-By` or `Signed-off-by` trailers; Signed-off-by is
  reserved for the human submitter.
