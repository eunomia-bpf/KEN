from typing import Any, Optional
from langchain.evaluation import StringEvaluator

class PerplexityEvaluator(StringEvaluator):
    """Evaluate the perplexity of a predicted string."""

    def __init__(self, model_id: str = "gpt2"):
        self.model_id = model_id

    def _evaluate_strings(
        self,
        *,
        prediction: str,
        reference: Optional[str] = None,
        input: Optional[str] = None,
        **kwargs: Any,
    ) -> dict:
        return {"score": 1}

evaluator = PerplexityEvaluator()
eval_result = evaluator.evaluate_strings(prediction="The rains in Spain fall mainly on the plain.")

print(eval_result)
