module ApplicationHelper
  def coderay(content)
    defaults = {
      :css => :class,
      :line_numbers => :inline,
      :tab_width => 2
    }

    content.gsub(/\<pre\>\<code class=\"(.+?)\"\>(.+?)\<\/code\>\<\/pre\>/m) do
      d = $2
      CodeRay.scan(unescape(d), $1).div(defaults)
    end
  end

  def markdown(text)
    options = {
        :hard_wrap => true,
        :autolink => true,
        :no_intra_emphasis => true,
        :fenced_code_blocks => true,
        :space_after_headers => true,
        :strikethough => true,
        :superscript => true
    }

    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    coderay(renderer.render(text)).html_safe
  end

  def unescape(content) # :nodoc:
    # use gsub in case nil is returned
    content.gsub(/(&quot;|&#39;|&amp;|&lt;|&gt;)/) do
      case $1
        when "&quot;"
          '"'
        when "&#39;"
          "'"
        when "&amp;"
          "&"
        when "&lt;"
          "<"
        when "&gt;"
          ">"
      end
    end
  end
end
