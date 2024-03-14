ActiveAdmin.register Store do

  permit_params :name, :person, :body, :password


  form do |f|
    f.inputs do
      f.input :name
      f.input :person
      f.input :password
      # f.input :body, as: :quill_editor
      f.input :body, as: :quill_editor, input_html: {
       data: { 
        options: { 
          modules: {
           toolbar: [[{ 'size': ['small', false, 'large', 'huge'] }],
           [{ 'font': [] }],
           [{ 'align': [] }],
           [{ 'color': [] }, { 'background': [] }],
            [{ 'list': 'ordered'}, { 'list': 'bullet' }],
            ['bold', 'italic', 'underline'], ['link' , 'image']] },
            placeholder: 'Type something...', theme: 'snow'
             } 
           } 
         }
    end
    f.actions
  end

end
