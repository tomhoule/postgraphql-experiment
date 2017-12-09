CREATE TABLE loc_api.edition (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v1mc(),
    title TEXT NOT NULL,
    editor TEXT NOT NULL,
    year INTEGER NOT NULL,
    language_code TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

COMMENT ON COLUMN loc_api.edition.title IS 'Descriptive name of the edition';
COMMENT ON COLUMN loc_api.edition.year IS 'Year of first publication';
COMMENT ON COLUMN loc_api.edition.year IS 'ISO 639-2 language code of the edition';

SELECT diesel_manage_updated_at('loc_api.edition');
