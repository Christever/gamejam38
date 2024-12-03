function isVisible(pX1, pY1, pX2, pY2, pVisibilityRadius)
    local dx = pX1 - pX2
    local dy = pY1 - pY2
    return dx * dx + dy * dy <= pVisibilityRadius * pVisibilityRadius
end