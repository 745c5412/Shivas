package org.shivas.server.core.castables.effects;

import org.shivas.common.random.Dice;
import org.shivas.data.entity.SpellLevel;
import org.shivas.data.entity.WeaponItemEffect;
import org.shivas.protocol.client.enums.ItemEffectEnum;
import org.shivas.protocol.client.enums.SpellEffectTypeEnum;
import org.shivas.server.core.castables.zones.Zone;
import org.shivas.server.core.fights.Fight;
import org.shivas.server.core.fights.FightCell;
import org.shivas.server.core.fights.FightException;
import org.shivas.server.core.fights.Fighter;

/**
 * Created with IntelliJ IDEA.
 * User: Blackrush
 * Date: 29/10/12
 * Time: 10:52
 */
public class WeaponItemEffectAdapter extends WeaponItemEffect implements EffectInterface {
    private final EffectInterface effect;

    public WeaponItemEffectAdapter(ItemEffectEnum type, Dice dice, EffectInterface effect) {
        super(type, dice);
        this.effect = effect;
    }

    @Override
    public SpellLevel getSpellLevel() {
        return null;
    }

    @Override
    public SpellEffectTypeEnum getSpellEffect() {
        return effect.getSpellEffect();
    }

    @Override
    public void setValue1(int value1) { }

    @Override
    public void setValue2(int value2) { }

    @Override
    public void setValue3(int value3) { }

    @Override
    public void setChance(int chance) { }

    @Override
    public void setNbTurns(int nbTurns) { }

    @Override
    public void setZone(Zone zone) { }

    @Override
    public WeaponItemEffectAdapter copy() {
        return new WeaponItemEffectAdapter(getType(), getDice(), effect.copy());
    }

    @Override
    public void apply(Fight fight, Fighter caster, FightCell target) throws FightException {
        effect.apply(fight, caster, target);
    }
}