// Entry point for the build script in your package.json
import { createApp } from 'vue';
//import App from './components/App.vue';

// Attach Vue to an element in your Rails layout (e.g., <div id="app"></div>)
//const app = createApp(App);
//app.mount('#app');
console.log('nabhiraj jain console statment');
let arr = [1,2,200];
let sum = 0;
for(let i=0;i<arr.length;i++){
    sum += arr[i];
}
console.log('the value of sum is ',sum);
