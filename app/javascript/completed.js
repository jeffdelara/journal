
document.addEventListener('turbolinks:load', () => {

  const checkboxes = document.querySelectorAll("input[data-task-id]");
  
  checkboxes.forEach((checkbox) => {

    checkbox.addEventListener('click', function() {

      const {taskId, categoryId, taskComplete} = checkbox.dataset;

      const isComplete = taskComplete === 'true' ? true : false

      if(isComplete) {
        checkbox.parentElement.classList.remove('line-through');
      } else {
        checkbox.parentElement.classList.add('line-through');
      }

      checkbox.setAttribute('data-task-complete', !isComplete);

    })
    
  })
})
