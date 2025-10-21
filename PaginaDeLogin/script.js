import React from "https://esm.sh/react@18.2.0";
import ReactDOM from "https://esm.sh/react-dom@18.2.0";

const Button = ({ children, className, ...props }) => (
  <button className={className} {...props}>
    {children}
  </button>
);

.btn-white.onClick = () => {
  appsmith.triggerEvent("onClick");
  {{ 
InsertFuncionario.run(() => {
  showAlert('Usuário cadastrado com sucesso!', 'success');
  navigateTo('TelaLogin');
}, (error) => {
  showAlert('Erro ao cadastrar: ' + error.message, 'error');
})
}}

};

function App() {
  const [currentIndex, setCurrentIndex] = React.useState(0);

  const handleNext = () => {
    setCurrentIndex((prevIndex) => (prevIndex + 1) % appsmith.model.tips.length);
  };

  const handleReset = () => {
    setCurrentIndex(0);
    appsmith.triggerEvent("onResetClick");
  };

  return (
    <div className="app">
      <div className="tip-container">
        <div className="tip-header">
          <h2>Custom Widget</h2>
          <div>{currentIndex + 1} / {appsmith.model.tips.length}</div>
        </div>
        <div className="content">{appsmith.model.tips[currentIndex]}</div>
      </div>
      <div className="button-container">
        <Button className="primary" onClick={handleNext}>Next Tip</Button>
        <Button className="reset" disabled={currentIndex === 0} onClick={handleReset}>Reset</Button>
      </div>
    </div>
  );
}

appsmith.onReady(() => {
/*
	 * This handler function will get called when parent application is ready.
	 * Initialize your component here
	 * more info - https://docs.appsmith.com/reference/widgets/custom#onready
	 */
    ReactDOM.render(<App />, document.getElementById("root"));
});