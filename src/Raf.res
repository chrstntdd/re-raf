type raf_id

@val
external requestAnimationFrame: (. int => unit) => raf_id = "requestAnimationFrame"
@val
external cancelAnimationFrame: raf_id => unit = "cancelAnimationFrame"

type controller = {
  play: unit => unit,
  pause: unit => unit,
}

@genType
let rafLoop = (draw, fps) => {
  let delay = 1000 / fps
  let tmp = ref(0)
  let raf_handle = ref(None)
  let last = ref(0)
  let frame = ref(-1)

  let pause = () => {
    switch raf_handle.contents {
    | Some(rafId) => {
        cancelAnimationFrame(rafId)
        last := 0
        raf_handle := None
        frame := -1
      }
    | None => ()
    }
  }

  let rec loop = time => {
    if last.contents === 0 {
      last := time
    }

    tmp := (time - last.contents) / delay

    if Js.Option.isSome(raf_handle.contents) {
      if tmp.contents > frame.contents {
        frame := tmp.contents
        draw(. frame.contents, pause)
      }

      raf_handle := Some(requestAnimationFrame(. loop))
    }
  }

  let play = () => {
    if Js.Option.isNone(raf_handle.contents) {
      raf_handle := Some(requestAnimationFrame(. loop))
    }
  }

  {play: play, pause: pause}
}
