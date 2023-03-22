let prelude = https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { bin =
    [ prelude.bin ⫽
      { src = "src/main.dats"
      , target = "${prelude.atsProject}/project"
      }
    ]
  , compiler = [0, 4, 2]
  , version = [0, 4, 2]
  }
