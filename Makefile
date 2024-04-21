INPUT_FILE=content/zh/docs/Reference/API/api.md
regular:
	sed -i 's/^## /### /g' ${INPUT_FILE}
	sed -i 's/<h1 .*">/## /g' ${INPUT_FILE}
	sed -i 's/<\/h1>//g' ${INPUT_FILE}
	sed -i 's/# Schemas/## Schema Reference/g' ${INPUT_FILE}
	sed -i 's/<h2 .*">/### /g' ${INPUT_FILE}
	sed -i 's/<\/h2>//g' ${INPUT_FILE}
	sed -i 's/^### Properties/#### Properties/g' ${INPUT_FILE}
	sed -i '/<!-- Generator/,+16 d' ${INPUT_FILE}
	sed -i '/> 200 Response/,+12 d' ${INPUT_FILE}
	sed -i '/To perform this operation/,+1 d' ${INPUT_FILE}
	sed -i 's/^title: ChimeStack API v0\.0\.1/title: API Version 0.0.1/' ${INPUT_FILE}
