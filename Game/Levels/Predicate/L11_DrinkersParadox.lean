import Game.Metadata

World "Predicate"
Level 11

Title "Drinker's Paradox"

Introduction
"
**Du**: Könnte ihr eigentlich immer nur im Chor oder durcheinander reden?

Wieder herrscht längeres Schweigen. Dann auf einmal:

**Alle**:  Es gibt unter uns eine Person, wenn die redet, dann reden alle!

Du kratzt Dich am Kopf.

**Robo**:  Ist doch klar. Das ist auf jedem bewohnten Planeten so!

**Du**:  Was??

**Robo**:  Das ist eine Version vom Drinker's Paradox!  Kennst du das nicht?  Dann lies
das am besten Mal in deiner Handbibliothek nach!  *In jeder Bar gibt es eine Person mit
der Eigenschaft, dass alle trinken, wenn sie trinkt.*  Genauer gesagt: in jeder nicht-leeren Bar.

**Du**: Glaube ich nicht.

**Robo**:  Glaube ich schon. Ich glaube sogar, du kannst das beweisen. Hier, probier mal!
"

open Function

Statement {People : Type} [Inhabited People] (isDrinking : People → Prop) :
    ∃ (x : People), isDrinking x → ∀ (y : People), isDrinking y := by
  Hint "
    **Du**: Also, `isDrinking` ist wieder so ein Prädikat …
    Wenn `p` eine Person ist, ist `isDrinking p` eine Aussage,
    die wahr oder falsch ist. Soweit so gut.
    Und was bedeutet `Inhabited People`?

    **Robo**: Das ist Leansch für nicht-leer. Das heißt einfach, es gibt mindestens eine Person.
    Du kannst dadurch jederzeit `default`, oder lang
    `(default : Person)`, schreiben, wenn du irgendeine Person brauchst.

    **Du**: Und wie fang ich jetzt an?

    **Robo**: Ich sagte doch, schau am besten Mal in deine Handbibliothek.
    Wenn ich mich richtige erinnere, hilft eine Fallunterscheidung, ob die Aussage
    `∀ (y : People), isDrinking y` wahr oder falsch ist."
  Hint (hidden := true) "**Robo**: Schau mal `by_cases` an."
  by_cases h : ∀ y, isDrinking y
  Hint (hidden := true) "
    **Du**: Und wen nehm ich jetzt?

    **Robo**: Wie gesagt, `default` ist eine x-beliebige Person."
  use (default : People)
  intro
  assumption
  Hint (hidden := true) "**Robo**: Du könntest hier mit `push_neg at {h}` weitermachen."
  push_neg at h
  Hint (hidden := true) "**Du**: Also nach `{h}` existiert ja eine Person, die nicht trinkt. Könnte ich diese brauchen damit die Aussage trivialerweise wahr wird?
  
  **Robo**: Schau dir mal an wie man `rcases` auf die Annahme `{h}` anwenden könnte."
  rcases h with ⟨p, hp⟩
  use p
  intro hp'
  Hint (hidden := true) "**Robo**: Was siehst du, wenn du `{hp}` und `{hp'}` anschaust?"
  contradiction

/--
`Inhabited U` ist eine Instanz, die aussagt, dass `U` mindestens ein Element
enthält.

Hat man eine solche Instanz, kann man immer das Element `(default : U)` verwenden.

Was `default` genau ist hängt davon ab, wie `Inhabited U` bewiesen wurde. Es könnte
also alles sein und man sollte sich nicht darauf verlassen, dass `default` eine
bestimmte Eigenschaft hat. Z.B. ist `(default : ℕ) = 0` aber es hätte genau so gut
als `1` oder `2` definiert werden können.
-/
DefinitionDoc Inhabited as "Inhabited"

/-- Das default-Element aus einem Typ mit einer `Inhabited U`-Instanz.

Man sollte generell nichts über `default` annehmen, aussert dass es existiert.

Nichtsdestotrotz, werden in Praxis oft semi-kanonische default-Elemente gewählt:
z.B. in `ℕ`, `ℤ`, `ℚ`, … ist `default` als `0` definiert, in `Set X` is `default`
die leere Menge `∅`, etc.
-/
TheoremDoc Inhabited.default as "default" in "Logic"

TheoremTab "Logic"
NewDefinition Inhabited
NewTheorem Inhabited.default

Conclusion
"
**Du**:  Verstehe. Aber jetzt habe ich auch wirklich genug von dieser Prädikatenlogik!

**Robo**:  Dann fliegen wir am besten weiter!  Aber bevor du fragst – hier ist wieder ein Überblick, was du auf diesem Planeten gelernt hast.


|               | Beschreibung                |
|:--------------|:----------------------------|
| `ℕ`           | Die natürlichen Zahlen.     |
| `∃`           | Existential-Quantifier      |
| `∀`           | Forall-Quantifier           |
| `Even n`      | `n` ist gerade              |
| `Odd n`       | `n` ist ungerade            |

|       | Taktik                    | Beispiel                                               |
|:------|:--------------------------|:-------------------------------------------------------|
| *12ᶜ* | `rw`                      | Umschreiben mit Gleichungen.                           |
| 13    | `ring`                    | Löst Gleichungen mit `+, -, *, ^`.                     |
| 14    | `unfold`                  | Setzt visuell die Bedeutung einer Definition ein.      |
| 15    | `use`                     | Um ein `∃` im Goal anzugehen.                          |
| *7ᶜ*  | `rcases h with ⟨x, hx⟩`   | Um ein `∃` in den Annahmen zu zerlegen.                |
| *8ᵇ*  | `intro`                   | Um ein `∀` im Goal anzugehen.                          |
| 16    | `push_neg`                | Für `¬∃` und `¬∀` im Goal.                             |
"
