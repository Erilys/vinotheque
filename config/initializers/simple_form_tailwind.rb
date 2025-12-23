# frozen_string_literal: true

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# Dir[Rails.root.join('lib/components/**/*.rb')].each { |f| require f }
# SimpleForm.include_component(InputComponent)

SimpleForm.setup do |config|
  text_input_classes = 'daisy-input w-full'

  label_classes = 'daisy-label'

  config.wrappers :vertical_form, tag: 'fieldset',
                                  class: 'daisy-fieldset mb-3',
                                  error_class: 'form-group-invalid',
                                  valid_class: 'form-group-valid' do |b|
    b.use :html5
    b.use :placeholder, class: 'text-sm text-gray-500'
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: label_classes
    b.use :input, class: text_input_classes,
                  error_class: 'is-invalid mb-1',
                  valid_class: 'is-valid'
    b.use :full_error,
          wrap_with: { tag: 'div',
                       class: 'block text-sm font-medium text-red-800 mt-1 pl-1 max-w-fit french-error-message' }
    b.use :hint, wrap_with: { tag: 'small', class: 'block text-sm font-medium text-gray-700 mt-1' }
  end

  # vertical input for radio buttons and check boxes
  config.wrappers :vertical_collection, tag: 'fieldset',
                                        class: 'form-group mb-3',
                                        error_class: 'form-group-invalid',
                                        valid_class: 'form-group-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper :legend_tag, tag: 'legend', class: 'col-form-label pt-0' do |ba|
      ba.use :label_text, class: 'block text-sm font-semibold text-gray-700 mb-1'
    end
    b.use :input, class: 'focus:ring-orange-350 h-4 w-4 text-indigo-600 border-red mr-2',
                  error_class: 'is-invalid mb-1',
                  valid_class: 'is-valid'
    b.use :full_error,
          wrap_with: { tag: 'div',
                       class: 'block text-sm font-medium text-indigo-800 mt-1 pl-1 max-w-fit' }
    b.use :hint, wrap_with: { tag: 'small', class: 'block text-sm font-medium text-gray-700 mt-1' }
  end

  # vertical input for radio buttons and check boxes
  # config.wrappers :vertical_check_boxes_collection, item_wrapper_class: 'form-check',
  #                                                   item_label_class: 'form-check-label',
  #                                                   tag: 'fieldset', class: 'form-group mb-6',
  #                                                   error_class: 'form-group-invalid',
  #                                                   valid_class: 'form-group-valid' do |b|
  #   b.use :html5
  #   b.optional :readonly
  #   b.wrapper :legend_tag, tag: 'legend', class: 'col-form-label pt-0' do |ba|
  #     ba.use :label_text, class: 'ml-3 block text-sm font-medium text-gray-700'
  #   end
  #   b.use :input, class: 'focus:ring-orange-350 h-4 w-4 text-indigo-600 border-gray-300 rounded mr-2',
  #                 error_class: 'is-invalid border-red-400',
  #                 valid_class: 'is-valid'
  #   b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback text-xs text-red-400' }
  #   b.use :hint, wrap_with: { tag: 'small', class: 'text-gray-500' }
  # end

  # horizontal input for inline radio buttons and check boxes
  config.wrappers :horizontal_collection_inline, tag: 'div',
                                                 class: 'flex flex-row items-center',
                                                 error_class: 'form-group-invalid',
                                                 valid_class: 'form-group-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: 'text-gray-800 font-normal'
    b.wrapper :grid_wrapper, tag: 'div', class: 'flex flex-row items-center' do |ba|
      ba.use :input, class: 'focus:ring-indigo-300 text-indigo-600 border-red mx-1',
                     error_class: 'is-invalid mb-1',
                     valid_class: 'is-valid'
    end
    b.use :full_error,
          wrap_with: { tag: 'div',
                       class: 'block text-sm font-medium text-red-700 mt-0.5 pl-2 max-w-fit' }
    b.use :hint, wrap_with: { tag: 'small', class: 'block text-sm font-medium text-gray-700' }
  end

  # Custom boolean
  config.wrappers :custom_boolean, tag: 'div',
                                                 class: 'mb-3',
                                                 error_class: 'form-group-invalid',
                                                 valid_class: 'form-group-valid' do |b|
    b.use :html5
    b.optional :readonly

    b.use :label_input, class: 'daisy-toggle', error_class: 'is-invalid mb-1', valid_class: 'is-valid'

    b.use :full_error,
          wrap_with: { tag: 'div',
                       class: 'block text-sm font-medium text-red-700 mt-0.5 pl-2 max-w-fit' }
    b.use :hint, wrap_with: { tag: 'small', class: 'block text-sm font-medium text-gray-700' }
  end


  # vertical multi select
  config.wrappers :vertical_multi_select, tag: 'div',
                                          class: 'mb-6',
                                          error_class: 'form-group-invalid',
                                          valid_class: 'form-group-valid' do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: label_classes
    b.wrapper tag: 'div',
              class: 'flex flex-col md:flex-row gap-1 justify-between items-center' do |ba|
      ba.use :input, class: text_input_classes,
                     error_class: 'is-invalid mb-1',
                     valid_class: 'is-valid'
    end
    b.use :full_error,
          wrap_with: { tag: 'div',
                       class: 'block text-sm font-medium text-indigo-800 mt-1 pl-1 max-w-fit' }
    b.use :hint, wrap_with: { tag: 'small', class: 'block text-sm font-medium text-gray-700 mt-1' }
  end

  # vertical input for boolean
  # config.wrappers :vertical_boolean, tag: 'fieldset', class: 'mb-6',
  #                                                     error_class: 'form-group-invalid',
  #                                                     valid_class: 'form-group-valid' do |b|
  #   b.use :html5
  #   b.optional :readonly
  #   b.wrapper :form_check_wrapper, tag: 'div' do |bb|
  #     bb.use :input, class: 'focus:ring-orange-350 h-4 w-4 text-indigo-600 border-gray-300 rounded mr-2',
  #                    error_class: '!border-red-500',
  #                    valid_class: 'is-valid'
  #     bb.use :label, class: 'mb-2'
  #   end
  #   b.use :full_error, wrap_with: { tag: 'div', class: 'invalid-feedback text-xs text-red-400' }
  #   b.use :hint, wrap_with: { tag: 'small', class: 'text-gray-500' }
  # end

  # vertical file input
  config.wrappers :vertical_file, tag: 'div',
                                  class: 'form-group',
                                  error_class: 'form-group-invalid',
                                  valid_class: 'form-group-valid' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :readonly
    b.use :label, class: 'block text-sm font-semibold text-gray-700 mb-1'
    b.use :input, class: 'w-full min-w-fit focus:ring-orange-350 focus:border-orange-350 block shadow-sm sm:text-sm border-red rounded-lg border',
                  error_class: 'is-invalid mb-1',
                  valid_class: 'is-valid'
    b.use :full_error,
          wrap_with: { tag: 'div',
                       class: 'block text-sm font-medium text-indigo-800 mt-1 pl-1 max-w-fit' }
    b.use :hint, wrap_with: { tag: 'small', class: 'block text-sm font-medium text-gray-700 mt-1' }
  end

  # Custom wrappers for input types. This should be a hash containing an input
  # type as key and the wrapper that will be used for all inputs with specified type.
  config.wrapper_mappings = {
    boolean: :custom_boolean,
    check_boxes: :vertical_collection,
    date: :vertical_form,
    file: :vertical_file,
    datetime: :vertical_multi_select,
    radio_buttons: :horizontal_collection_inline,
    textarea: :vertical_form,
    time: :vertical_multi_select
  }

  # How the label text should be generated altogether with the required text.
  config.label_text = ->(label, required, _explicit_label) { "#{label} #{required}" }

  # CSS class for buttons
  config.button_class = ''

  # Set this to div to make the checkbox and radio properly work
  # otherwise simple_form adds a label tag instead of a div around
  # the nested label
  config.item_wrapper_tag = :div

  # CSS class to add for error notification helper.
  config.error_notification_class = 'mb-4 text-sm font-medium text-red-700'

  # Method used to tidy up errors. Specify any Rails Array method.
  # :first lists the first message for each field.
  # :to_sentence to list all errors for each field.
  config.error_method = :to_sentence

  # The default wrapper to be used by the FormBuilder.
  config.default_wrapper = :vertical_form

  # add validation classes to `input_field`
  config.input_field_error_class = 'is-invalid'
  config.input_field_valid_class = 'is-valid'
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
