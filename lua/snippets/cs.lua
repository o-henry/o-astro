local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("mono", {
    t "using UnityEngine;",
    t { "", "" },
    t "public class ",
    i(1, "ClassName"),
    t " : MonoBehaviour",
    t { "", "{" },
    t { "", "    [SerializeField] private " },
    i(2, "GameObject target"),
    t ";",
    t { "", "", "    private void Awake()" },
    t { "", "    {" },
    t { "", "        " },
    i(3),
    t { "", "    }", "", "    private void Start()" },
    t { "", "    {" },
    t { "", "        " },
    i(4),
    t { "", "    }", "", "    private void Update()" },
    t { "", "    {" },
    t { "", "        " },
    i(5),
    t { "", "    }", "}" },
  }),
  s("awake", { t "private void Awake()", t { "", "{" }, t { "", "    " }, i(1), t { "", "}" } }),
  s("start", { t "private void Start()", t { "", "{" }, t { "", "    " }, i(1), t { "", "}" } }),
  s("update", { t "private void Update()", t { "", "{" }, t { "", "    " }, i(1), t { "", "}" } }),
  s("fixed", { t "private void FixedUpdate()", t { "", "{" }, t { "", "    " }, i(1), t { "", "}" } }),
  s("trigger", {
    t "private void OnTriggerEnter(Collider other)",
    t { "", "{" },
    t { "", "    " },
    i(1),
    t { "", "}" },
  }),
  s("collision", {
    t "private void OnCollisionEnter(Collision collision)",
    t { "", "{" },
    t { "", "    " },
    i(1),
    t { "", "}" },
  }),
  s("serialize", { t "[SerializeField] private ", i(1, "float"), t " ", i(2, "moveSpeed"), t ";" }),
  s("ulog", { t 'Debug.Log("', i(1, "message"), t '");' }),
}
