module TableHelper
  def custom_table_for(items, order)
    @columns = ['disagree', 'indifferent', 'agree']
    yield #content_tag(:p, "Hello world!")

      content_tag :table do
        thead + tbody(items, order)
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

  def tbody(items, order)
    content_tag :tbody do
      items.each { |e|
       concat(content_tag(:tr){
        concat(content_tag(:td, e))
        @columns.each_with_index do |c, index|
          concat(content_tag(:td, radio_button_tag("survey[answers_attributes][#{order}][response][]", index )))
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