module I18NData
  extend self
  
  def languages(language_code='EN')
    data_provider.translated_or_english(:languages,language_code)
  end

  def countries(language_code='EN')
    data_provider.translated_or_english(:countries,language_code)
  end

  def data_provider
    if @data_provider
      @data_provider
    else
      require 'i18n_data/file_data_provider'
      LiveDataProvider
    end
  end

  def data_provider=(provider)
    @data_provider = provider
  end
  
  class NoTranslationAvailable < Exception
    def to_s
      "NoTranslationAvailable -- #{super}"
    end
  end
end