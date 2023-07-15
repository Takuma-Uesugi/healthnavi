'use strict'

const ctx = document.getElementById('chart')

const type = 'radar'

const labels = [
  '国語',
  '数学',
  '理科',
  '社会',
  '英語',
];
const data = {
  labels: labels,
  datasets: [{
    label: 'Aさん',
    data: [55, 96, 88, 42, 70],
    backgroundColor: 'rgba(255, 99, 132, 0.5)',
    borderColor: 'rgb(255, 99, 132)',
  },{
    label: 'Bさん',
    data: [94, 33, 29, 86, 90],
    backgroundColor: 'rgba(54, 162, 235, 0.5)',
    borderColor: 'rgb(54, 162, 235)',
  }]
};

const options = {
  title: {
    display: true,
    text: "試験結果"
  },
  scale: {
    ticks: {
      min: 0,
      max: 100,
      stepSize: 10,
    }
  }
}

const chart = new Chart(ctx, {
  type: type,
  data: data,
  options: options
})