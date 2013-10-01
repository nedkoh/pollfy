module TableHelper
  def custom_table_for(items)
    @columns = ['disagree', 'indifferent', 'agree']
    yield #content_tag(:p, "Hello world!")

      content_tag :table do
        thead + tbody(items)
    end
    #content_tag :table do
    #  thead + tbody(items)
    #end

  end

  def thead
    content_tag :thead do
      content_tag :tr do 
        #print empty column for series
        concat(content_tag(:th, ""))
        @columns.each do |c|
          concat(content_tag(:th, c))
        end
      end
    end
  end

  def tbody(items)
    content_tag :tbody do
      items.each { |e|
       concat(content_tag(:tr){
        concat(content_tag(:td, e))
        @columns.each do |c|
          concat(content_tag(:td, radio_button_tag(:radio, 'bla')))
        end
        })
      }
    end
  end

  def column(name, value = nil, &block)
    #value = name unless value
    #@columns << {:name => name, :value => value, :block => block}
  end
end