# 1.0.1  06/07/16

* fixing issue #81 by pushing this updated Changelog.md :)
* PR from mschae fixing issue #80 broken hex package

## Kudos:
  Michael Schaefermeyer (mschae) & Tobias Pfeiffer (PragTob)

# 1.0.0  06/07/16

* --version | -v switch for `earmark` escript.
* added security notice about XSS to docs thanks to remiq
* PR from alakra (issue #59) to allow Hypens and Unicode in fenced code block names
* PR from sntran to fix unsafe conditional variables from PR
* PR from riacataquian to use maps instead of dicts
* PR from gmile to remove duplicate tests
* PR from gmile to upgrade poison dependency
* PR from whatyouhide to fix warnings for Elixir 1.4 with additional help from milmazz
* Travis for 1.2.x and 1.3.1 as well as OTP 19
* Fixes for issues:
  - #61
  - #66
  - #70
  - #71
  - #72
  - #77
  - #78

## Kudos:
Remigiusz Jackowski (remiq), Angelo Lakra (alakra), Son Tran-Nguyen (sntran), Mike Kreuzer (mikekreuzer),
Ria Cataquian (riacataquian), Eugene Pirogov (gmile), Andrea Leopardi (whatyouhide) & Milton Mazzarri (milmazz)

# 0.2.1  01/15/16

* Added 1.2 for Travis
* PR from mneudert to fix HTMLOneLine detection

## Kudos:

Marc Neudert (mneudert) 


# 0.2.0  12/28/15

* PR from eksperimental guaranteeing 100% HTML5
* PR from imbriaco to decouple parsing and html generation and whitespace removal
* Fixes for issues:
  - #40
  - #41
  - #43
  - #48
  - #50
  - #51
* Explicit LICENSE change to Apache 2.0 (#42)
* Loading of test support files only in test environment thanks to José Valim
* IO Capture done correctly thanks to whatyouhide
* Warning for Elixir 1.2 fixed by mschae

## Kudos:

Eksperimental (eksperimental), Mark Imbriaco (imbriaco), Andrea Leopardi(whatyouhide), José Valim &
Michael Schaefermeyer (mschae)

# 0.1.19 10/27/15

* Fix | in implicit lists, and restructur the parse a little.
  Many thanks to Robert Dober
  
# 0.1.17 05/18/15

* Add strikethrough support to the HTML renderer. Thanks to
  Michael Schaefermeyer (mschae)


# 0.1.16 05/08/15

* Another fix from José, this time for & in code blocks.


# 0.1.15 03/25/15

* Allow numbered lists to start anywhere in the first four columns.
  (This was previously allowed for unnumbered lists). Fixes #13.


# 0.1.14 03/25/15

* Fixed a problem where a malformed text heading caused a crash.
  We now report what appears to be malformed Markdown and
  continue, processing the line as text. Fixes #17.


# 0.1.13 01/31/15

* José fixed a bug in Regex that revealed a problem with some
  Earmark replacement strings. As he's a true gentleman, he then
  fixed Earmark.


# 0.1.11 08/18/14

* Matthew Lyon contributed footnote support.

      the answer is clearly 42.[^fn-why] In this case
      we need to…

      [^fn-why]: 42 is the only two digit number with
                 the digits 4 and 2 that starts with a 4.

  For now, consider it experimental. For that reason, you have
  to enable it by passing the `footnotes: true` option.


# 0.1.10 08/13/14

* The spec is ambiguous when it comes to setext headings. I assumed
  that they needed a blank line after them, but common practice says
  no. Changed the parser to treat them as headings if there's no
  blank.


# 0.1.9 08/05/14

* Bug fix—extra blank lines could be appended to code blocks.
* Tidied up code block HTML


# 0.1.7 07/26/16

* Block rendering is now performed in parallel


# 0.1.6 07/25/16

* Added support for Kramdown-style attribute annotators for all block
  elements, so you can write

        # Warning
        {: .red}

        Do not turn off the engine
        if you are at altitude.
        {: .boxed #warning spellcheck="true"}

  and generate

        <h1 class="red">Warning</h1>
        <p spellcheck="true" id="warning" class="boxed">Do not turn
        off the engine if you are at altitude.</p>


# 0.1.5 07/20/16

* Merged two performance improvements from José Valim
* Support escaping of pipes in tables, so

        a  |  b
        c  |  d \| e

  has two columns, not three.


# 0.1.4 07/14/16

* Allow list bullets to be indented, and deal with potential subsequent
  additional indentation of the body of an item.


# 0.1.3 07/14/16

* Added tasks to the Hex file list


# 0.1.2 07/14/14

* Add support for GFM tables


# 0.1.1 07/09/14

* Move readme generation task out of mix.exs and into tasks/
* Fix bug if setext heading started on first line


# 0.1.0 07/09/14

* Initial Release
