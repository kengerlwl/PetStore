package repetstore.dao;


import repetstore.domain.Sequence;

public interface SequenceDAO {
    Sequence getSequence(Sequence sequence);
    void updateSequence(Sequence sequence);
}
