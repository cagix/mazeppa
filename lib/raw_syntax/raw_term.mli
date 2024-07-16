type t =
  | Var of Symbol.t
  | Const of Const.t
  | Call of Symbol.t * t list
  | Match of t * match_case list
  | Let of Symbol.t * t * t

and match_case = pattern * t

and pattern = Symbol.t * Symbol.t list [@@deriving eq, show]

val var : string -> t

val int : Checked_oint.generic -> t

val string : string -> t

val call : string * t list -> t

val var_list : Symbol.t list -> t list

(** [is_immediate t] returns [true] if [t] does not diverge or panic, and [false] if it
    possibly can. *)
val is_immediate : t -> bool

val to_string : t -> string

val verbatim : t -> string

val pattern_to_string : pattern -> string

val pattern_verbatim : pattern -> string
