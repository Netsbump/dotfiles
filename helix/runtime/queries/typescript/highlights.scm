; Extend Helix's built-in TypeScript highlights so type-literal property
; signatures can be styled independently from runtime object keys.
;
; Keep the standard TypeScript/ECMAScript queries, then add a more specific
; capture for keys in declarations such as:
;   type T = { foo: string }

; inherits: ecma,_typescript

(property_signature
  name: (property_identifier) @variable.other.member.type)
