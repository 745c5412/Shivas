package org.shivas.server.core.commands;

import org.shivas.common.params.Conditions;
import org.shivas.common.params.Parameters;
import org.shivas.server.core.guilds.GuildCreationInteraction;
import org.shivas.server.core.interactions.InteractionException;
import org.shivas.server.core.logging.DofusLogger;
import org.shivas.server.services.game.GameClient;

/**
 * Created with IntelliJ IDEA.
 * User: Blackrush
 * Date: 23/09/12
 * Time: 11:09
 */
public class CreateGuildCommand implements Command {
    @Override
    public String name() {
        return "create_guild";
    }

    @Override
    public Conditions conditions() {
        return Conditions.EMPTY;
    }

    @Override
    public String help() {
        return "Open the creation guild panel";
    }

    @Override
    public boolean canUse(GameClient client) {
        return !client.player().hasGuild();
    }

    @Override
    public void use(GameClient client, DofusLogger log, Parameters params) {
        try {
            client.interactions().push(new GuildCreationInteraction(client)).begin();
        } catch (InteractionException e) {
            e.printStackTrace();
        }
    }
}