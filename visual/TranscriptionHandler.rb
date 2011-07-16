require 'www-library/HTMLWriter'

require 'application/SiteContainer'

class TranscriptionHandler < SiteContainer
  def renderTranscriptionForm
    writer = WWWLib::HTMLWriter.new
    writer.form(@submitTextHandler.getPath) do
      writer.p do
        options = @languages.map do |description, handler|
          WWWLib::SelectOption.new(description, description)
        end
        writer.select(Language, options)
      end
      writer.p do
        writer.textArea('Text', LanguageText) {}
      end
      writer.submit
    end
    return writer.output
  end

  def renderTranscription(lines)
    writer = WWWLib::HTMLWriter.new
    writer.p do
      'Output:'
    end
    writer.ul(class: 'output') do
      lines.each do |line|
        writer.li { line.join }
      end
    end
    return writer.output
  end
end
