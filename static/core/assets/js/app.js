//we can set animation delay as following in ms (default 1000)
ProgressBar.singleStepAnimation = 1500;
ProgressBar.init(
	["Requisição Realizada", "Entrevista Presencial", "Finalizado - Adoção Realizada"],
	currentStage,
	"progress-bar-wrapper" // created this optional parameter for container name (otherwise default container created)
);
