# Paranoid RSpec

This is a little wrapper script to run RSpec with inverted expectations - `to` will act like `not_to`, and vice versa. Use it to catch tests that are passing by accident because the `expect` is not actually running. See `tests.rb` for some examples.

## Usage

Run `./prspec.sh` the same way you would run `rspec`. For instance: `./prspec.sh ./spec/**`. It will print a list of tests that pass with expectations inverted.

You'll need to run it with your preferred shell or `chmod +x ./prspec.sh` first.
