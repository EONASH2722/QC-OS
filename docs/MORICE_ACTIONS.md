# MORICE Actions

The execution chain is planner → typed action registry → schema validation →
permission/policy check → confirmation gate → trusted Binder service → Android
API. Neither a local nor remote model receives a shell, root, raw Binder, or
arbitrary intent interface.

Each action defines identity, versioned parameters, caller/user restrictions,
preconditions, sensitivity, confirmation rule, timeout, idempotency behavior,
audit redaction and structured result. Destructive actions require explicit
confirmation. Fast-path commands use the same registry and authorization as
intelligent-path commands.
