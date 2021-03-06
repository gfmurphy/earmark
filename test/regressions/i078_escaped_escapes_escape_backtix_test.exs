defmodule Regressions.I078EscapedEscapesEscapeBacktix do
  use ExUnit.Case
  import ExUnit.CaptureIO

  defp open_file(filename) do
    case File.open(filename, [:utf8]) do
      {:ok, device} -> device 
      {:error, reason} -> IO.puts(:stderr, "Unable to open file: #{filename}, #{reason}")
    end
  end

  defp html_from_file(filename) do 
    IO.stream( open_file(filename), :line)
    |> Enum.to_list()
    |> Earmark.to_html()
  end

  defp blox_from_file(filename) do
    IO.stream( open_file(filename), :line)
    |> Enum.to_list()
    |> Earmark.Parser.parse()
  end

  test "Issue https://github.com/pragdave/earmark/issues/78 broken markdown" do 
  # Broken code in line 42 
    assert capture_io( :stderr, fn->
      html_from_file("test/fixtures/i078_broken.md")
    end) == "<no file>:42: warning: Closing unclosed backquotes ` at end of input\n"
    # Yes this is correct unless we forbid multiline inline code blocks the error
    # cannot be detected earlier
  end


  test "Issue https://github.com/pragdave/earmark/issues/78 fixed markdown" do 
  # Fixed code in line 42
    assert capture_io( :stderr, fn->
      html_from_file("test/fixtures/i078_fixed.md")
    end) == ""
    # IO.puts html_from_file("test/fixtures/i078_fixed.md")
  end

  @markdown """
  Hello `\\\\` \\
      World
  """
  @short_html """
  <p>Hello <code class="inline">\\\\</code> \\</p>\n<pre><code>World</code></pre>
  """
  @expected_html """
  <p>  Notice we had to escape the escape character <code class=\"inline\">\\\\</code>. By giving <code class=\"inline\">\\0</code>,

  <pre><code>  iex&gt; String.replace(&quot;a,b,c&quot;, &quot;b&quot;, &quot;[]&quot;, insert_replaced: 1)\n      &quot;a,[b],c&quot;</code></pre>\n
  """
  test "Issue https://github.com/pragdave/earmark/issues/78 correct blocks" do 
  # assert html_from_file("test/fixtures/i078_short.md") == @expected_html 
  # assert (@markdown |> String.split("\n") |> Earmark.Parser.parse()) == 
    assert blox_from_file("test/fixtures/i078_short.md") ==
      {[%Earmark.Block.Para{attrs: nil, lines: ["Hello `\\\\` \\\\"]},
        %Earmark.Block.Code{attrs: nil, language: nil, lines: ["World"]}], %{}}
  end

  test "Issue https://github.com/pragdave/earmark/issues/78 correct html" do 
    assert html_from_file("test/fixtures/i078_short.md") == @short_html 
  end
end
