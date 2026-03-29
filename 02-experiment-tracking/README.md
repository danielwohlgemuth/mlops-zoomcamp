# Experiment Tracking

## Concepts

- ML Experiment: The process of building a model.
- Experiment Run: The execution of an experiment with specific parameters.
- Run Artifact: The produced by the experiment run.
- Experiment Metadata: Additional information related to the experiment.

Experiment tracking means keeping a record of the information related to an ML experiment.
This could be:
- Source code
- Environment
- Data
- Model
- Hyperparameters
- Metrics

## MLflow

[MLflow](https://mlflow.org/) is a platform for managing LLMs, AI agents, and machine learning models.

It covers two main areas:
- LLMs and Agents: observability, evaluation, prompt management, model access, and cost control.
- Machine Learning: experiment tracking, model evaluation, model registry, and model deployment.

As the Zoomcamp focuses on traditional machine learning workflows, the capabilities of MLflow to manage LLMs and agents will not be explored.

## MLflow Setup

```bash
uvx mlflow server
```

![MLflow Home](/02-experiment-tracking/assets/mlflow-home.png)

The home screen of MLflow shows recent experiments. In the top left corner is a toggle to switch between GenAI (LLMs and agents) and Model training (machine learning). Here we use Model training, which includes Experiments and Model registry as the two top-level options.

To track an experiment run, use the following code snippet.

```python
import mlflow

mlflow.set_tracking_uri("http://localhost:5000")
mlflow.set_experiment(experiment_name="nyc-taxi")
mlflow.autolog()
```

See the [diabetes-experiment](/02-experiment-tracking/diabetes-experiment.ipynb) notebook for a simple example of how MLflow can be integrated.

In MLflow, this shows up as a new run with a random name (blushing-gnu-288 in this case).

![Experiment Runs](/02-experiment-tracking/assets/mlflow-experiments-runs.png)

![Experiment Run Details](/02-experiment-tracking/assets/mlflow-experiments-runs-details.png)

A model related to the run is also registered.

![Experiment Models](/02-experiment-tracking/assets/mlflow-experiments-models.png)

![Experiment Model Details](/02-experiment-tracking/assets/mlflow-experiments-models-details.png)

## Conda Setup

Conda is an environemnt manager for Python that helps with keeping package versions isolated from other projects to avoid conflicts. 

### Initialize Conda Config

```bash
conda init --all # Initialize all currently available shells.
conda create --name exp-tracking-env
```

### Activate Conda Environemnt

```bash
conda activate exp-tracking-env
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Deactivate Conda Environment

```bash
conda deactivate
```
