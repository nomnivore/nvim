return {
  "lua/ollama",
  optional = true,

  opts = {
    ---@type table<string, Ollama.Prompt>
    prompts = {
      AA_Display = {
        prompt = "Write a 3 paragraph essay on the topic of your choice.",
        action = "display",
      },

      AA_Insert = {
        prompt = "Write a 3 paragraph essay on the topic of your choice.",
        action = "insert",
        extract = false,
      },

      AA_Replace = {
        prompt = "Reword this to be extremely confusing:\n$sel",
        system = "You speak only in Old English.",
        action = "display_replace",
        extract = false,
      },

      AA_Echo = {
        prompt = "Repeat this word back to me: $sel",
      },
    },
  },
}
