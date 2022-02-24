
document.addEventListener('turbolinks:load', () => {

  const checkboxes = document.querySelectorAll("input[data-task-id]");
  
  checkboxes.forEach((checkbox) => {

    checkbox.addEventListener('click', function() {

      const {taskId, categoryId, taskComplete} = checkbox.dataset;

      const isComplete = taskComplete === 'true' ? true : false

      const payload = {
        task_id: taskId, 
        category_id: categoryId,
        completed: !isComplete
      };

      const headers = {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      };

      const options = {
        method: 'POST', 
        headers: headers, 
        body: JSON.stringify(payload)
      };

      fetch(`/accomplished_tasks/${taskId}`, options)
        .then(response => {
          return response.json()
        })
        .then(data => {
          if(data.message === 'success') {
            console.log('Successful update.');
          }
        });

      if(isComplete) {
        checkbox.parentElement.classList.remove('line-through');
      } 
      else {
        checkbox.parentElement.classList.add('line-through');
      }

      checkbox.setAttribute('data-task-complete', !isComplete);

    })
    
  });
});
