from __future__ import annotations
from abc import ABC
from typing import Generic, TypeVar

T = TypeVar("T")


class BaseFactory(ABC, Generic[T]):
    class Config:
        model: T

    ...
