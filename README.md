# doc-buddy
An open-source RAG with an interactive followup question generator.

## Goal
To create a custom RAG to work on medical documents as an assistant for junior physicians.


## Method
This is a RAG implementation with minimal dependencies and without the use of popular RAG frameworks such as Langchain and Llamaindex. It leverages followup questions, if the
answer is not satisfactory in order to give the most accurate answer given the context of the question. The interaction continues until the user hasn't indicated that the answer
is accepted.

## Structure

[client_notebook.ipynb](https://github.com/SimplyVlad/doc-buddy/blob/main/client_notebook.ipynb) is used for interaction with the open-source Small Language Models API endpoints, which are hosted in
[API_notebook.ipynb](https://github.com/SimplyVlad/doc-buddy/blob/main/backend/API_notebook.ipynb).
[data_processing_and_chunking.ipynb](https://github.com/SimplyVlad/doc-buddy/blob/main/data_preparation/data_processing_and_chunking.ipynb) is the notebook responsible for data loading and preparation for the purpose of the RAG.


## Quick start

1. Read and chunk a PDF file/directory of files using [data_processing_and_chunking.ipynb](https://github.com/SimplyVlad/doc-buddy/blob/main/data_preparation/data_processing_and_chunking.ipynb) in order to create ```data/data_cleaned.csv``` and ```data/full_page_info.csv```.
2. Run [API_notebook.ipynb](https://github.com/SimplyVlad/doc-buddy/blob/main/backend/API_notebook.ipynb) to create a vector store and host the search and model generation API end points. We recommend using a managed environment such as Google Colab. The notebook was tested on a
Google Colab with A100 GPU. The ngrock tunnel link should be copied and pasted to ```client_notebook.ipynb```
3. The [client_notebook.ipynb](https://github.com/SimplyVlad/doc-buddy/blob/main/client_notebook.ipynb) can be run both in an environment using ```jupyter notebook``` or directly by building a docker container using
```docker build -t container_name```
```docker run container_name ```
Make sure to include the latest ```data/data_cleaned.csv``` with the same data set as the one used in the backend.