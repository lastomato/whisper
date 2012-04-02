module ApplicationHelper
  def coderay(content)
    defaults = {
      :css => :class,
      :line_numbers => :inline,
      :tab_width => 2
    }

    content.gsub!(/\<pre\>\<code class=\"(.+?)\"\>(.+?)\<\/code\><\/pre\>/m) do
      CodeRay.scan($2, $1).div(defaults).html_safe
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
end
