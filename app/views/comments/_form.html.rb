<div class="row mb-3" id="comment-form">
  <div class="col-lg-8 offset-lg-2">
    <%= form_with model: comment, url: board_comments_path(board) do |f| %>
      <%= f.label :body %>
      <%= f.text_area :body, class: "form-control mb-3", row: "4", placeholder: Comment.human_attribute_name(:body) %>
      <%= f.submit t('defaults.post'), class: "btn btn-primary" %>
    <% end %>
  </div>
</div>
