module ApplicationHelper
  def markdown(text)
    erbified = ERB.new(text.html_safe).result(binding)
    options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis]
    Redcarpet.new(erbified, *options).to_html.html_safe
  end
end
