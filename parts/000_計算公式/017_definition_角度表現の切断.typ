#import "../../theorem.typ": theorem, claim, proof, definition, remark, note, theorem_rules

#definition([角度表現の切断])[
  $s_((-pi, pi]) : RR \/ ~_(angle) -> (-pi, pi]$ を以下のように定める。

  $[theta]_(~_(angle)) in RR \/ ~_(angle)$ に対して、

  $n in ZZ$ で、

  $
    -pi < theta - 2n pi <= pi
  $

  を満たすようなものがただ一つ存在して、(証明略)

  この $n$ を用いて、

  $
    s_((-pi, pi])([theta]_(~_(angle))) := theta - 2n pi
  $

  と定める。
]
