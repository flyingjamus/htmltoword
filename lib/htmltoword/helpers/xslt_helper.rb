module Htmltoword
  module XSLTHelper
    def document_xslt(extras = false)
      file_name = extras ? 'htmltoword' : 'base'
      xslt_path(file_name)
    end

    def xslt_path(template_name)
      File.join(Htmltoword.config.default_xslt_path, "#{template_name}.xslt")
    end

    def xslt(options = {})
      stylesheet_name = options[:stylesheet_name]
      stylesheet_path = options[:stylesheet_path]
      return Nokogiri::XSLT(File.open(stylesheet_path)) if stylesheet_path
      Nokogiri::XSLT(File.open(xslt_path(stylesheet_name)))
    end
  end
end
