# align-equals

A linux command to align lines with an equal sign.

## Installation

Download the x86_64 static binary from [releases](https://github.com/maiha/align-equals/releases).

## Usage

```console
$ cat foo
a = 1
foo = xyz

$ align-equals foo
a   = 1
foo = xyz
```

See [spec](./spec)

## For Emacs

```lisp
(defun align-equals-region ()
  (interactive)
  (if (> (point) (mark)) 
      (exchange-point-and-mark))
  (call-process-region (point) (mark) "align-equals" t t t)
)
(global-set-key "(AS-YOU-LIKE)" 'align-equals-region)
```

Run `M-x align-equals-region` or some binded key.

```
a = 1
foo = xyz
```
↓
```
a   = 1
foo = xyz
```

This works regardless of which emacs mode you are in.

## Development

```console
$ make
$ make test
```

## Contributing

1. Fork it (<https://github.com/maiha/align-equals/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) - creator and maintainer
